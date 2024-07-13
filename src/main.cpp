#include "raylib.h"
#include "settings.h"

int main() 
{
  InitWindow(screenWidth, screenHeight, "Raylib basic window");
  SetTargetFPS(60);
  
  while (!WindowShouldClose())
  {
    BeginDrawing();
    ClearBackground(RAYWHITE);
    DrawText("It works!", 20, 20, 20, BLACK);
    EndDrawing();
  }

  CloseWindow();
  return 0;
}