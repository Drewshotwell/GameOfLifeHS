module Main where

import Life
import Render
import Constants

import System.Random
import Data.List.Split (splitOn)

main :: IO ()
main = do
    boardStr <- readFile "rndIndexes.txt"
    coordStr <- readFile "coords.txt"
    let initBoard1 = map (\s -> read s :: Int) . splitOn "\n" $ boardStr
    let initBoard2 = map parseCoordStr . splitOn "\n" $ coordStr
    initBoard3 <- sequence . replicate ((size*size) `div` 10) $ randomRIO (0, (size*size) - 1)
    --displayLifeState initBoard2
    simulateGameOfLife initBoard3
            
readInt :: String -> Int
readInt s = read s :: Int

parseCoordStr :: String -> Int
parseCoordStr =
    coordToIndex .
    (\xs -> (read (xs !! 0) :: Int, read (xs !! 1) :: Int)) .
    splitOn ","

coordToIndex :: (Int, Int) -> Int
coordToIndex (x, y) = x*size + y