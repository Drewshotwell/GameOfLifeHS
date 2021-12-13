module Main where

import Life
import Graphics.Gloss
import Data.List.Split (splitOn)

main :: IO ()
main = do
    boardStr <- readFile "rndIndexes"
    let initBoard = map (\s -> read s :: Int) . splitOn "\n" $ boardStr
    print initBoard
    --display (InWindow "Nice Window" screenDims (50, 50)) white (color black $ translate 23.0 22.0 $ scale 26.666666 26.666666 $ polygon $ [(-13.333333,-13.333333),(-13.333333,13.333333),(13.333333,13.333333),(13.333333,-13.333333)])
    simulate window bgClr fps initBoard modelToPicture stepFunction

size :: Int
size = 30

screenDims :: (Int, Int)
screenDims = (800, 800)

bgClr :: Color
bgClr = black

fps :: Int
fps = 1

modelToPicture :: Board -> Picture
modelToPicture b =
    let indexesToCoords = map (flip divMod size) b -- [(Int, Int)]
        scaleBy = (fromIntegral (fst screenDims) :: Float) / (fromIntegral size :: Float)
        -- (Int, Int) -> Picture i.e. polygon (rectanglePath)
        -- coordsToRect (x, y) = color white . translate (fromIntegral x :: Float) (fromIntegral y :: Float) . scale scaleBy scaleBy . polygon $ rectanglePath (scaleBy) (scaleBy)
        coordsToRect (x, y) = 
            color white . 
            translate (fromIntegral x :: Float) (fromIntegral y :: Float) .
            scale scaleBy scaleBy .
            polygon $
            rectanglePath (scaleBy) (scaleBy)
    in  coordsToRect $ head indexesToCoords
        --pictures $ map coordsToRect indexesToCoords

--stepFunction :: ViewPort -> Float -> Board -> Board
stepFunction _ _ = nextBoard size

window :: Display
window = InWindow "Haskell Conway's Game of Life" screenDims (50, 50)