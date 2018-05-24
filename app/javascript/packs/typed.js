import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Woof", "Find Local Dog Walkers", "Find Cute Dogs To Spend Time With", "Bark Bark", "Dog Noise in French",
    "Woof Woof","Find Dog Lovers Near You"],
    typeSpeed: 80,
    loop: true
  });
}

loadDynamicBannerText();
