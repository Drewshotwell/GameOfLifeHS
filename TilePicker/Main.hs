import Graphics.Gloss

main :: IO ()
main = do
    play window black fps world 

fps :: Int
fps = 20

world :: [Int]
world = []

window :: Display
window = InWindow "Tile Picker" (800, 800) (50, 50)