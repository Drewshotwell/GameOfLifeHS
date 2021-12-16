module Life where

import Constants

import Data.List

nextBoard :: Board -> Board
nextBoard aliveIdxs =
    let deadIdxs = [0..(size*size) - 1] \\ aliveIdxs
    in  filter (\i -> numAdjacentCells i aliveIdxs `elem` [2,3]) 
            aliveIdxs
     ++ filter (\i -> numAdjacentCells i aliveIdxs == 3)
            deadIdxs

numAdjacentCells :: Int -> Board -> Int
numAdjacentCells idx aliveIdxs =
    let bRowCol = map (flip divMod size) aliveIdxs
        (idxRow, idxCol) = divMod idx size
    in  length $ [(iRow, iCol) | (iRow, iCol) <- bRowCol, 
            ((abs (iCol - idxCol) <= 1) && (abs (iRow - idxRow) == 1)) ||
            ((abs (iRow - idxRow) <= 1) && (abs (iCol - idxCol) == 1))]