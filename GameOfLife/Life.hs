module Life where

import System.Random
import Data.List

type Board = [Int]

nextBoard :: Int -> Board -> Board
nextBoard size b = 
    filter (\i ->
        if i `elem` b then
            numAdjacentCells i size b `elem` [2,3]
        else
            numAdjacentCells i size b == 3
        )
    [0..(size*size)]

numAdjacentCells :: Int -> Int -> Board -> Int
numAdjacentCells idx size b =
    let bRowCol = map (flip divMod size) b
        (idxRow, idxCol) = divMod idx size
    in  length $ [(iRow, iCol) | (iRow, iCol) <- bRowCol, 
            ((abs (iCol - idxCol) <= 1) && (abs (iRow - idxRow) == 1)) ||
            ((abs (iRow - idxRow) <= 1) && (abs (iCol - idxCol) == 1))]