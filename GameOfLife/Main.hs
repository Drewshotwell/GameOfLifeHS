module Main where

import Life
import Render
import Constants

import System.Random
import Data.List.Split (splitOn)

main :: IO ()
main = do
    initBoard <- sequence . replicate ((size*size) `div` 10) $ randomRIO (0, (size*size) - 1)
    simulateGameOfLife initBoard