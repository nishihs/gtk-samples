module Gtk.Samples where

import Gtk.Samples.Internal

import Graphics.UI.Gtk

testListStore :: IO ()
testListStore = do
  ls <- listStoreNew []
  is <- mapM (listStoreAppend ls) [1..10000]
  print is

--testListStore' :: IO ()
testListStore' liststore = do
  mapM_ (listStoreAppend liststore) [1..10000]
