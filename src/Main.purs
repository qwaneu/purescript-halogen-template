module Main where

import Prelude

import Component (component)
import Control.Monad.Eff (Eff)
import DOM.Node.ParentNode (QuerySelector(..))
import Data.Traversable (traverse_)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)

appElement :: QuerySelector
appElement = QuerySelector "#app"

main :: Eff (HA.HalogenEffects ()) Unit
main = HA.runHalogenAff do
  HA.awaitLoad
  traverse_ (runUI component unit) =<< HA.selectElement appElement
