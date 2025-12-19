#include <raylib.h>

#define PARTICLE_COUNT 100

struct Particle {
  Vector2 pos;
  double timeStarted;
  // time at which the particle will terminate
  double timeEnd;
};

typedef struct Particle Particle;

Particle createNewParticle(Vector2 pos, double duration) {
  double currentTime = GetTime();
  Particle newParticle;
  newParticle.pos = pos;
  newParticle.timeStarted = currentTime;
  newParticle.timeEnd = currentTime + duration;

  return newParticle;
}

struct GameData {
  // 100-size array for particles
  Particle particles[PARTICLE_COUNT];
  // particle spaces that are currently in use
  _Bool usedParticles[PARTICLE_COUNT];
  int peakFps;
};

typedef struct GameData GameData;

void gameLoop(GameData *);

int main(int argc, char **argv) {
  const int width = 1440, height = 900;
  GameData gamedata;

  gamedata.peakFps = 0;

  InitWindow(width, height, "C Example");

  while (!WindowShouldClose()) {
    BeginDrawing();

    ClearBackground(RAYWHITE);
    gameLoop(&gamedata);

    EndDrawing();
  }

  CloseWindow();
  return 0;
}

void drawParticles(GameData *gameData) {
  for (int i = 0; i < PARTICLE_COUNT; i++) {
    if (gameData->usedParticles[i]) {
      Particle particle = gameData->particles[i];
      Color fadedRed = Fade(RED, (particle.timeEnd - GetTime()) /
                                     (particle.timeEnd - particle.timeStarted));
      DrawCircleV(particle.pos, 10, fadedRed);
    }
  }
}

int nextFreeParticle(GameData *gameData) {
  int retval = -1;
  for (int i = 0; i < PARTICLE_COUNT; i++) {
    if (!gameData->usedParticles[i]) {
      retval = i;
      break;
    }
  }

  return retval;
}

void clearExpiredParticles(GameData *gameData) {
  for (int i = 0; i < PARTICLE_COUNT; i++) {
    if (gameData->usedParticles[i]) {
      Particle particle = gameData->particles[i];
      if (particle.timeEnd < GetTime()) {
        TraceLog(LOG_INFO, "clearing particle at %d", i);
        gameData->usedParticles[i] = false;
      }
    }
  }
}

void gameLoop(GameData *gameData) {
  int lastFps = GetFPS();
  if (GetTime() > 1) {
    if (lastFps > gameData->peakFps) {
      gameData->peakFps = lastFps;
      TraceLog(LOG_INFO, "New peak FPS: %d", lastFps);
    }
  }
  const char *fpsText = 0;
  const char *peakFpsText = 0;
  fpsText = TextFormat("FPS: %d", lastFps);
  peakFpsText = TextFormat("Peak FPS: %d", gameData->peakFps);
  DrawText(fpsText, 500, 400, 20, BLACK);
  DrawText(peakFpsText, 500, 440, 20, BLACK);

  if (IsMouseButtonPressed(MOUSE_BUTTON_LEFT)) {
    Vector2 mousePos = GetMousePosition();
    Particle newParticle = createNewParticle(mousePos, 2);
    int nextFreeParticleIndex = nextFreeParticle(gameData);
    if (nextFreeParticleIndex >= 0) {
      gameData->particles[nextFreeParticleIndex] = newParticle;
      gameData->usedParticles[nextFreeParticleIndex] = true;
    }
  }

  clearExpiredParticles(gameData);

  drawParticles(gameData);
}
