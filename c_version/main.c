#include <raylib.h>
#include <stdio.h>

#define PARTICLE_COUNT 100

struct Particle {
  Vector2 pos;
  double timeStarted;
  // duration in seconds
  double duration;
  // multiplier of how fast it should progress through the animation
  double speed;
};

typedef struct Particle Particle;

Particle createNewParticle(Vector2 pos, double speed, double duration) {
  double currentTime = GetFrameTime();
  Particle newParticle;
  newParticle.pos = pos;
  newParticle.timeStarted = currentTime;
  newParticle.speed = speed;
  newParticle.duration = duration;

  return newParticle;
}

struct GameData {
  // 100-size array for particles
  Particle particles[PARTICLE_COUNT];
  // particle spaces that are currently in use
  _Bool usedParticles[PARTICLE_COUNT];
};

typedef struct GameData GameData;

void gameLoop(GameData *);

int main(int argc, char **argv) {
  const int width = 1440, height = 900;
  GameData gamedata;
  for (int i = 0; i < PARTICLE_COUNT; i++) {
    printf("%d", gamedata.usedParticles[i]);
  }

  InitWindow(width, height, "C Example");

  SetTargetFPS(60);

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
      TraceLog(LOG_INFO, "drawing particle at %f, %f", particle.pos.x,
               particle.pos.y);
      DrawCircle(particle.pos.x, particle.pos.y, 10, RED);
      TraceLog(LOG_INFO, "drawing particle at %d", i);
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

void gameLoop(GameData *gameData) {
  DrawText("Hello there!", 500, 400, 20, BLACK);

  if (IsMouseButtonPressed(MOUSE_BUTTON_LEFT)) {
    Vector2 mousePos = GetMousePosition();
    Particle newParticle = createNewParticle(mousePos, 1, 5000);
    int nextFreeParticleIndex = nextFreeParticle(gameData);
    gameData->particles[nextFreeParticleIndex] = newParticle;
    gameData->usedParticles[nextFreeParticleIndex] = true;
  }

  drawParticles(gameData);
}
