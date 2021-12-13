module Life where

import Constants

import Data.List

nextBoard :: Int -> Board -> Board
nextBoard size marked =
    let unmarked = [0..(size*size) - 1] \\ marked
    in  filter (\i -> numAdjacentCells i size marked `elem` [2,3]) 
            marked
     ++ filter (\i -> numAdjacentCells i size marked == 3)
            unmarked

numAdjacentCells :: Int -> Int -> Board -> Int
numAdjacentCells idx size marked =
    let bRowCol = map (flip divMod size) marked
        (idxRow, idxCol) = divMod idx size
    in  length $ [(iRow, iCol) | (iRow, iCol) <- bRowCol, 
            ((abs (iCol - idxCol) <= 1) && (abs (iRow - idxRow) == 1)) ||
            ((abs (iRow - idxRow) <= 1) && (abs (iCol - idxCol) == 1))]