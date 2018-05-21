import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["woof"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
