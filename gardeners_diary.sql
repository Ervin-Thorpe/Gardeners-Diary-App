-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2017 at 12:48 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gardeners_diary`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_patch_activities`
--

CREATE TABLE `active_patch_activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `patch_activity_id` int(11) NOT NULL,
  `activity_start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `active_patch_activities`
--

INSERT INTO `active_patch_activities` (`id`, `user_id`, `patch_activity_id`, `activity_start_date`) VALUES
(6, 2, 17, '2017-03-20'),
(24, 1, 31, '2017-03-21'),
(31, 1, 33, '2017-03-26'),
(33, 8, 44, '2017-04-16'),
(34, 8, 45, '2017-04-16'),
(42, 1, 43, '2017-04-21'),
(45, 1, 50, '2017-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `completed_activities`
--

CREATE TABLE `completed_activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `garden_layout_JSON` text NOT NULL,
  `plant_name` varchar(30) NOT NULL,
  `patch_name` varchar(30) NOT NULL,
  `activity_name` varchar(30) NOT NULL,
  `completion_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `completed_activities`
--

INSERT INTO `completed_activities` (`id`, `user_id`, `garden_layout_JSON`, `plant_name`, `patch_name`, `activity_name`, `completion_date`) VALUES
(3, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":592.74,"height":596.46,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":203.75,"top":50,"width":192.97,"height":96.37,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra 420 Patch","tileType":"patch_tile","tilePatchNum":6},{"type":"tile-rect","originX":"left","originY":"top","left":330,"top":200,"width":50,"height":50,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"patch_tile","tileType":"patch_tile","tilePatchNum":8}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Carrots Patch', 'Watering', '2017-03-23'),
(4, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":592.74,"height":596.46,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":203.75,"top":50,"width":192.97,"height":96.37,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra 420 Patch","tileType":"patch_tile","tilePatchNum":6},{"type":"tile-rect","originX":"left","originY":"top","left":330,"top":200,"width":50,"height":50,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"patch_tile","tileType":"patch_tile","tilePatchNum":8}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Tomatoes Patch', 'Watering', '2017-03-23'),
(5, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":592.74,"height":596.46,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":203.75,"top":50,"width":192.97,"height":96.37,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra 420 Patch","tileType":"patch_tile","tilePatchNum":6},{"type":"tile-rect","originX":"left","originY":"top","left":330,"top":200,"width":50,"height":50,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"patch_tile","tileType":"patch_tile","tilePatchNum":8}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Carrots Patch', 'Watering', '2017-03-23'),
(6, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":592.74,"height":596.46,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":203.75,"top":50,"width":192.97,"height":96.37,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra 420 Patch","tileType":"patch_tile","tilePatchNum":6}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Tomatoes Patch', 'Watering', '2017-03-23'),
(7, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":592.74,"height":596.46,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":203.75,"top":50,"width":192.97,"height":96.37,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra 420 Patch","tileType":"patch_tile","tilePatchNum":6},{"type":"tile-rect","originX":"left","originY":"top","left":280,"top":170,"width":50,"height":50,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"water_tile","tileType":"water_tile","tilePatchNum":"Not Patch"}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Tomatoes Patch', 'Watering', '2017-03-23'),
(8, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":593.14,"height":594.1,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra 420 Patch","tileType":"patch_tile","tilePatchNum":6},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":53.75,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":200,"top":50,"width":197.63,"height":97.91,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":360,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Carrots Patch', 'Watering', '2017-03-29'),
(9, 3, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":268.36,"top":80.53,"width":119.04,"height":119.04,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":60,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Tomatoes Patch', 'Watering', '2017-03-29'),
(10, 8, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":290.21,"top":158.33,"width":91.81,"height":90.58,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":60,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Vegetable Patch","tileType":"patch_tile","tilePatchNum":3}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Vegetable Patch', 'Watering', '2017-04-16'),
(11, 7, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":340,"top":140,"width":175.98,"height":175.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":60,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Vegetable Patch","tileType":"patch_tile","tilePatchNum":2}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Vegetable Patch', 'Harvesting', '2017-04-16'),
(12, 7, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":340,"top":140,"width":175.98,"height":175.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":60,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Vegetable Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":70,"top":60,"width":127.98,"height":127.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"New Patch Tile","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":400,"top":20,"width":172.97,"height":172.97,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"123456789012345678901234567...","tileType":"patch_tile","tilePatchNum":4}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', '123456789012345678901234567890', '123456789012345678901234567...', '123456789012345678901234567890', '2017-04-16'),
(13, 7, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":340,"top":140,"width":175.98,"height":175.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":60,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Vegetable Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":70,"top":60,"width":127.98,"height":127.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"New Patch Tile","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":400,"top":20,"width":172.97,"height":172.97,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"123456789012345678901234567...","tileType":"patch_tile","tilePatchNum":4}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', '123456789012345678901234567890', '123456789012345678901234567...', '123456789012345678901234567890', '2017-04-16'),
(14, 7, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":340,"top":140,"width":175.98,"height":175.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":60,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Vegetable Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":70,"top":60,"width":127.98,"height":127.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"New Patch Tile","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":400,"top":20,"width":172.97,"height":172.97,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"123456789012345678901234567...","tileType":"patch_tile","tilePatchNum":4}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', '123456789012345678901234567890', '123456789012345678901234567...', '123456789012345678901234567890', '2017-04-17'),
(15, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":593.14,"height":594.1,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":200,"top":50,"width":197.63,"height":97.91,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":360,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":50,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":60,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra Patch","tileType":"patch_tile","tilePatchNum":6}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Water Cress', 'Tomatoes Patch', 'Watering', '2017-04-21');
INSERT INTO `completed_activities` (`id`, `user_id`, `garden_layout_JSON`, `plant_name`, `patch_name`, `activity_name`, `completion_date`) VALUES
(16, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":593.14,"height":594.1,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":200,"top":50,"width":197.63,"height":97.91,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":360,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":50,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":60,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra Patch","tileType":"patch_tile","tilePatchNum":6}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Tomatoes', 'Extra Patch', 'Watering', '2017-04-21'),
(17, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":593.14,"height":594.1,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":200,"top":50,"width":197.63,"height":97.91,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":360,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":50,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":60,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra Patch","tileType":"patch_tile","tilePatchNum":6}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}', 'Cabbage', 'Extra Patch', 'No name given.', '2017-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `garden_layouts`
--

CREATE TABLE `garden_layouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `canvas_JSON` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `garden_layouts`
--

INSERT INTO `garden_layouts` (`id`, `user_id`, `canvas_JSON`) VALUES
(16, 1, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":0,"width":593.14,"height":594.1,"fill":{"type":"pattern","source":"http://localhost:8000/images/grass_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Grass","tileType":"grass_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":200,"top":50,"width":197.63,"height":97.91,"fill":{"type":"pattern","source":"http://localhost:8000/images/water_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":360,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Pond","tileType":"water_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":50,"top":50,"width":94,"height":97.88,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Tomatoes Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":0,"top":250,"width":591.75,"height":101.94,"fill":{"type":"pattern","source":"http://localhost:8000/images/walkpath_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Walkpath","tileType":"walkpath_tile","tilePatchNum":"Not Patch"},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":50,"width":98.87,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Carrots Patch","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":450,"top":450,"width":96.81,"height":95.59,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Extra Patch","tileType":"patch_tile","tilePatchNum":6},{"type":"tile-rect","originX":"left","originY":"top","left":60,"top":450,"width":343,"height":98.87,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Cabbages Patch","tileType":"patch_tile","tilePatchNum":7},{"type":"tile-rect","originX":"left","originY":"top","left":200,"top":160,"width":196.03,"height":67.83,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"123456789012345678901234567...","tileType":"patch_tile","tilePatchNum":8}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}'),
(17, 3, '{"objects":[],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}'),
(18, 8, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":290.21,"top":158.33,"width":91.81,"height":90.58,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":60,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Vegetable Patch","tileType":"patch_tile","tilePatchNum":3}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}'),
(19, 7, '{"objects":[{"type":"tile-rect","originX":"left","originY":"top","left":340,"top":140,"width":175.98,"height":175.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":60,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"Vegetable Patch","tileType":"patch_tile","tilePatchNum":2},{"type":"tile-rect","originX":"left","originY":"top","left":70,"top":60,"width":127.98,"height":127.98,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"New Patch Tile","tileType":"patch_tile","tilePatchNum":3},{"type":"tile-rect","originX":"left","originY":"top","left":400,"top":20,"width":172.97,"height":172.97,"fill":{"type":"pattern","source":"http://localhost:8000/images/patch_tile.png","repeat":"repeat","offsetX":0,"offsetY":0},"stroke":"green","strokeWidth":6,"strokeDashArray":null,"strokeLineCap":"butt","strokeLineJoin":"miter","strokeMiterLimit":10,"scaleX":1,"scaleY":1,"angle":0,"flipX":false,"flipY":false,"opacity":1,"shadow":null,"visible":true,"clipTo":null,"backgroundColor":"","fillRule":"nonzero","globalCompositeOperation":"source-over","transformMatrix":null,"skewX":0,"skewY":0,"rx":0,"ry":0,"name":"123456789012345678901234567...","tileType":"patch_tile","tilePatchNum":4}],"background":{"type":"pattern","source":"http://localhost:8000/images/800x800_grid_40m_2px.jpg","repeat":"repeat","offsetX":0,"offsetY":0}}');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('testemail', '8d2f1b50d0a3929dfd51e3046a359acd84a5320ae013c075c85b80c0e011dbdd', '2017-03-27 20:37:37'),
('ervinthorpe', '5430efcdafb0cb431ac6f556f213509f11151d66e9b175dbd95f71d104ae8604', '2017-03-27 20:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `patches`
--

CREATE TABLE `patches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `patch_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patches`
--

INSERT INTO `patches` (`id`, `user_id`, `name`, `patch_num`) VALUES
(71, 2, 'Patch 1', 1),
(2217, 8, 'Vegetable Patch', 3),
(2268, 7, 'Vegetable Patch', 2),
(2269, 7, 'New Patch Tile', 3),
(2270, 7, '123456789012345678901234567...', 4),
(2394, 1, 'Tomatoes Patch', 2),
(2395, 1, 'Carrots Patch', 3),
(2396, 1, 'Extra Patch', 6),
(2397, 1, 'Cabbages Patch', 7),
(2398, 1, '123456789012345678901234567...', 8);

-- --------------------------------------------------------

--
-- Table structure for table `patch_user_activities`
--

CREATE TABLE `patch_user_activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `patch_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `user_activity` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patch_user_activities`
--

INSERT INTO `patch_user_activities` (`id`, `user_id`, `patch_id`, `activity_id`, `user_activity`) VALUES
(17, 2, 1, 55, 1),
(31, 1, 7, 49, 1),
(33, 1, 2, 30, 1),
(40, 1, 2, 54, 1),
(41, 1, 2, 53, 1),
(43, 1, 3, 30, 1),
(47, 7, 4, 95, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'testname', 'testemail@email.com', '$2y$10$QjrQ/.5OdTmJ5aLuicKRGOvJC902MTNMjfV/PvFoOCTEtlFPzDt3u', 'AkMVkQGlbfBeMxzOygXd2yR401ad7UVCONYPvAC75cCctAbrf6gWTzUdshKX', '2017-02-18 21:11:38', '2017-04-21 18:29:55'),
(2, 'Testname2', 'testemail2@email.com', '$2y$10$cnAYAC9HZT2p2XfnOvSBLe7Th5vP/4MjqFYa4ejeO8FJNqomJj0cy', 'e2PrnZBeGVypK3Bb2Lt1esFEHb7oMkpKcoYM3TObhjbMghxAxKqmHLRigfaJ', '2017-02-18 21:23:50', '2017-03-23 00:01:16'),
(3, 'Testname3', 'testemail3@email.com', '$2y$10$9mWtMtP2YfJCX2XJfdXj4u6Ju/p.IEwCOSgPk5VOQSS7u43Meebwe', 'YX86u6cZt4i4OyD4WvidwkegXDHVv4GKv97KJ8eRDylwQlOAztB6QACrKeV2', '2017-02-18 21:40:14', '2017-03-29 17:56:05'),
(4, 'Testuser4', 'testemail3@email.co4', '$2y$10$yFjUolEg62RqgouFGK4rHOqtYy0IqRiP/NN5geFVDH31wa/bnBmtW', 'ibFo7g2xDYS0ZtzzDFKcBEnZem6wGt0XKlzBq4RSlJ1523LzgObvj0lM60Kl', '2017-03-22 00:50:01', '2017-03-22 00:51:15'),
(5, 'Test4', 'testemail4@email.com', '$2y$10$7R/VxQ6vG7MVg76uXT3Ed.CfoVzFBtQyuN7gsY1B2iqtoMzcg0aza', 'C4cahn3w5DbST7wwKOZStq9L3bfJek2MiGYfFcrCve4MOsvxVFLpZ26fKPXK', '2017-03-27 19:41:31', '2017-04-15 23:22:31'),
(6, 'Ervin Thorpe', 'ervin-thorpe@fakeemail.com', '$2y$10$hLF3iVMQ6ZRuwP9A46VIWuLZGE.sbBJ0x0APZWyknA6cG.Sad3VeC', 'TMXr4sWQWgFJ1nht0JpjtTJQ7tIp5CxEn4CNVtnGRFVFvUeijNOrFXWVVg7m', '2017-03-27 20:38:37', '2017-03-27 20:38:41'),
(7, 'Test Name 2', 'testemail5@email.com', '$2y$10$UQgrXluS4ZtTJ3ioFcU8w.HbtsZI.zjWf9sxCIH3doZxcUM1ObwTm', 'XxCPcLAMN4F1jdAK6savvlO5vn4I3SSCezrBs484cUkozZpKUfjgVAgJA7td', '2017-04-12 23:38:43', '2017-04-17 01:52:59'),
(8, 'Bobby Jones', 'bobbyjones@fakeemail.com', '$2y$10$tjJY8YR.d/xqURACXq32a.O5As7V05Vc2QgNJe6laJKwCYidJNQnm', '7n8WYBbtROlCQ0jwjNJYBKXB43WRQ8ADvPITqN9SIPtYqKzZE8a1ZxTnnAmQ', '2017-04-16 14:19:10', '2017-04-17 02:03:51');

-- --------------------------------------------------------

--
-- Table structure for table `users_plants`
--

CREATE TABLE `users_plants` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_plants`
--

INSERT INTO `users_plants` (`id`, `user_id`, `name`, `description`) VALUES
(46, 1, 'Tomatoes', 'Description for my tomatoes'),
(49, 1, 'Cabbage', 'Description for Cabbages'),
(50, 1, 'Water Cress', 'Water Cress Description'),
(51, 2, 'Tomatoes User2 ', 'Tomatoes Description User2'),
(86, 3, 'Tomatoes', 'Description for Tomatoes'),
(91, 7, 'Tomatoes', 'Tomatoes Description'),
(92, 7, '123456789012345678901234567890', '1231231231231597845641365145986478694894786949'),
(96, 1, '123456789012345678901234567890', 'sdfg');

-- --------------------------------------------------------

--
-- Table structure for table `users_plant_activities`
--

CREATE TABLE `users_plant_activities` (
  `id` int(11) NOT NULL,
  `users_plant_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `days` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_plant_activities`
--

INSERT INTO `users_plant_activities` (`id`, `users_plant_id`, `user_id`, `name`, `description`, `days`) VALUES
(30, 46, 1, 'Watering', 'Watering Tomatoes', 1),
(49, 49, 1, 'Watering', 'Watering Cabbages', 2),
(50, 49, 1, 'Activity Name 2', 'Activity Description 2', 2),
(51, 49, 1, 'Activity Name 3', 'No description given.', 3),
(52, 49, 1, 'No name given.', 'Activity Description 4', 4),
(53, 49, 1, 'No name given.', 'No description given.', 5),
(54, 50, 1, 'Watering', 'Watering Description for Water Cress', 1),
(55, 51, 2, 'Watering', 'Watering Tomatoes', 1),
(85, 86, 3, 'Watering', 'Watering Tomatoes', 1),
(91, 91, 7, 'Watering', 'Watering Tomatoes', 1),
(92, 91, 7, 'Harvesting', 'Harvesting Tomatoes', 10),
(95, 92, 7, '123456789012345678901234567890', 'Description', 2),
(96, 92, 7, '123456789012345678901234567890', 'Description 2', 5),
(97, 92, 7, '123456789012345678901234567890', 'No description given', 1),
(105, 96, 1, '123456789012345678901234567890', 'sfdg', 134);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_patch_activities`
--
ALTER TABLE `active_patch_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `completed_activities`
--
ALTER TABLE `completed_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `garden_layouts`
--
ALTER TABLE `garden_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `patches`
--
ALTER TABLE `patches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patch_user_activities`
--
ALTER TABLE `patch_user_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_plants`
--
ALTER TABLE `users_plants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_plant_activities`
--
ALTER TABLE `users_plant_activities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_patch_activities`
--
ALTER TABLE `active_patch_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `completed_activities`
--
ALTER TABLE `completed_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `garden_layouts`
--
ALTER TABLE `garden_layouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `patches`
--
ALTER TABLE `patches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2399;
--
-- AUTO_INCREMENT for table `patch_user_activities`
--
ALTER TABLE `patch_user_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users_plants`
--
ALTER TABLE `users_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `users_plant_activities`
--
ALTER TABLE `users_plant_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
