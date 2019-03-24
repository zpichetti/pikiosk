import "bootstrap";

import { news } from '../components/news';
if (document.getElementById("news")) {
  setInterval(news(),300000);
}

import { updatetime } from '../components/time';
if (document.getElementById("time")) {
  updatetime()
}