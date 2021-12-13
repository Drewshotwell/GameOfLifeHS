module Render where

import Constants
import Life

import Graphics.Gloss

scaleBy :: Float
scaleBy = (fromIntegral screenDim :: Float) / (fromIntegral size :: Float)

modelToPicture :: Board -> Picture
modelToPicture = pictures . map (coordToRect . flip divMod size)

coordToRect :: (Int, Int) -> Picture
coordToRect (x, y) = 
      color black . 
      translate (translateBy x) (translateBy y) .
      scale scaleBy scaleBy . 
      polygon $
      rectanglePath 1 1
         where translateBy a = (-1)*( (fromIntegral screenDim :: Float) / 2) + scaleBy*(fromIntegral a :: Float) - scaleBy / 2

simulateGameOfLife :: Board -> IO () -- list of initial indexes to the simulated game of life
simulateGameOfLife b = simulate window bgClr fps b modelToPicture stepFunction
   where 
      window = InWindow "Conway's Game of Life HS" screenDims (50, 50)
      bgClr = white
      fps = 1

stepFunction _ _ = nextBoard size