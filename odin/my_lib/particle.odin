package particle
import rl "vendor:raylib"

Particle :: struct {
	pos:         rl.Vector2,
	timeStarted: f64,
	timeEnd:     f64,
	speed:       f64,
}
