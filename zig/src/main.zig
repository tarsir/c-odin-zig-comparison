const std = @import("std");
const rl = @cImport({
    @cInclude("raylib.h");
});

const PARTICLE_COUNT = 100;

const Particle = struct {
    position: rl.Vector2,
    timeStart: f64,
    timeEnd: f64,
};

fn createParticle(pos: rl.Vector2, duration: f64) Particle {
    return Particle{
        .position = pos,
        .timeStart = rl.GetTime(),
        .timeEnd = rl.GetTime() + duration,
    };
}

const GameData = struct {
    particles: [PARTICLE_COUNT]Particle = undefined,
    usedParticles: [PARTICLE_COUNT]bool = [_]bool{false} ** PARTICLE_COUNT,
    peakFps: i32,
};

pub fn main() !void {
    rl.InitWindow(1440, 900, "Zig Raylib Example");

    var gameData: GameData = .{ .peakFps = 0 };

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        rl.ClearBackground(rl.RAYWHITE);
        handleFrame(&gameData);
        rl.EndDrawing();
    }
}

fn handleFrame(gameData: *GameData) void {
    const lastFps = rl.GetFPS();
    if (rl.GetTime() > 1) {
        if (lastFps > gameData.peakFps) {
            gameData.peakFps = lastFps;
        }
    }

    const fpsText = rl.TextFormat("FPS: %d", lastFps);
    const peakFpsText = rl.TextFormat("Peak FPS: %d", gameData.peakFps);
    rl.DrawText(fpsText, 500, 400, 20, rl.BLACK);
    rl.DrawText(peakFpsText, 500, 440, 20, rl.BLACK);

    if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_LEFT)) {
        const mousePos = rl.GetMousePosition();
        for (0..PARTICLE_COUNT) |idx| {
            if (!gameData.usedParticles[idx]) {
                gameData.particles[idx] = createParticle(mousePos, 2.0);
                gameData.usedParticles[idx] = true;
                rl.TraceLog(rl.LOG_INFO, "Creating particle at %d", idx);
                break;
            }
        }
    }

    drawParticles(gameData);
    expireParticles(gameData);
}

fn drawParticles(gameData: *GameData) void {
    const time = rl.GetTime();
    for (0..PARTICLE_COUNT) |idx| {
        if (gameData.usedParticles[idx]) {
            const particle = gameData.particles[idx];
            const alpha = (particle.timeEnd - time) / (particle.timeEnd - particle.timeStart);
            const fadedRed = rl.ColorAlpha(rl.RED, @floatCast(alpha));
            rl.DrawCircleV(particle.position, 20.0, fadedRed);
        }
    }
}

fn expireParticles(gameData: *GameData) void {
    const time = rl.GetTime();
    for (gameData.particles, 0..) |particle, idx| {
        if (gameData.usedParticles[idx] and particle.timeEnd < time) {
            gameData.usedParticles[idx] = false;
            gameData.particles[idx] = undefined;
            rl.TraceLog(rl.LOG_INFO, "Expiring particle at %d", idx);
        }
    }
}
