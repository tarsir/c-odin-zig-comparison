package main

import "my_lib"
import rl "vendor:raylib"

height: i32 = 900
width: i32 = 1440
duration: f64 = 2
particleCount := 100

main :: proc() {
	gameData := GameData {
		peakFps = 0,
	}
	rl.InitWindow(width, height, "Odin Example")

	for (!rl.WindowShouldClose()) {
		rl.BeginDrawing()

		handleFrame(&gameData)

		rl.EndDrawing()
	}
}

handleFrame :: proc(gameData: ^GameData) {
	rl.ClearBackground(rl.RAYWHITE)

	lastFps := rl.GetFPS()
	if (rl.GetTime() > 1) {
		if (lastFps > gameData.peakFps) {
			gameData.peakFps = lastFps
		}
	}

	fpsText := rl.TextFormat("FPS: %d", lastFps)
	peakFpsText := rl.TextFormat("Peak FPS: %d", gameData.peakFps)
	rl.DrawText(fpsText, 500, 400, 20, rl.BLACK)
	rl.DrawText(peakFpsText, 500, 440, 20, rl.BLACK)

	if (rl.IsMouseButtonPressed(rl.MouseButton.LEFT)) {
		position := rl.GetMousePosition()
		particle := createNewParticle(position, 500, duration)
		freeIndex := nextFreeParticle(gameData)
		if freeIndex >= 0 {
			gameData.particles[freeIndex] = particle
			gameData.usedParticles[freeIndex] = true
			rl.TraceLog(rl.TraceLogLevel.INFO, "Creating particle at pos %d", freeIndex)
		}
	}

	drawParticles(gameData)
	expireParticles(gameData)
}

GameData :: struct {
	particles:     [100]my_lib.Particle,
	usedParticles: [100]bool,
	peakFps:       i32,
}

createNewParticle :: proc(pos: rl.Vector2, speed, duration: f64) -> my_lib.Particle {
	currentTime := rl.GetTime()
	newParticle := my_lib.Particle {
		pos         = pos,
		timeStarted = currentTime,
		timeEnd     = currentTime + duration,
		speed       = speed,
	}

	return newParticle
}

drawParticles :: proc(state: ^GameData) {
	for i in 0 ..< particleCount {
		if state.usedParticles[i] {
			particle := state.particles[i]
			currentTime := rl.GetTime()
			alphaPercent :=
				(particle.timeEnd - currentTime) / (particle.timeEnd - particle.timeStarted)
			color := rl.ColorAlpha(rl.RED, f32(alphaPercent))
			rl.DrawCircleV(particle.pos, 20, color)
		}
	}
}

expireParticles :: proc(state: ^GameData) {
	currentTime := rl.GetTime()
	for i in 0 ..< particleCount {
		if state.usedParticles[i] {
			if state.particles[i].timeEnd <= currentTime {
				state.usedParticles[i] = false
				rl.TraceLog(rl.TraceLogLevel.INFO, "Expiring particle at pos %d", i)
			}
		}
	}
}

nextFreeParticle :: proc(state: ^GameData) -> int {
	for i in 0 ..< particleCount {
		if !state.usedParticles[i] {
			return i
		}
	}

	return -1
}
