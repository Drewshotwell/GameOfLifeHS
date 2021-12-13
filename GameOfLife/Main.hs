module Main where

import Life
import Render
import Constants

import System.Random
import Data.List

main :: IO ()
main = do
    g <- newStdGen
    let initBoard = take ((size*size) `div` 10) . nub $ (randomRs (0, (size*size) - 1) g :: [Int])
    simulateGameOfLife initBoard