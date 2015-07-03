-- | 

module Main where

import Graphics.UI.Gtk
import Gtk.Samples
import Control.Monad.IO.Class (liftIO)

main :: IO ()
main = do
  initGUI

  builder <- builderNew
  builderAddFromFile builder "interface.glade"
  window <- builderGetObject builder castToWindow "window1"

  tview <- builderGetObject builder castToTreeView "treeview1"
  col1 <- builderGetObject builder castToTreeViewColumn "treeviewcolumn1"

  ls <- listStoreNew []

  renderer1 <- cellRendererTextNew
  cellLayoutPackStart col1 renderer1 True

  cellLayoutSetAttributes col1 renderer1 ls $ \row -> [ cellText := show row ]

  treeViewSetModel tview ls

  btn <- builderGetObject builder castToButton "button1"

        
  btn `on` buttonPressEvent $ tryEvent $ liftIO (testListStore' ls)

  window `on` deleteEvent $ liftIO mainQuit >> return False

  widgetShowAll window
  mainGUI
