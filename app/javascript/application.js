// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  const logo = document.querySelector(".site-header-logo");
  if (!logo) return;

  // Turbo の自動遷移を止める
  logo.addEventListener("click", (e) => {
    e.preventDefault();
  });

  logo.addEventListener("mousedown", () => {
    const link = logo.closest("a");
    if (!link) return;

    logo.classList.add("poie-press");

    // アニメーション終了後に遷移（0.45秒）
    setTimeout(() => {
      window.location.href = link.href;
    }, 200);

    // クラスを消して次回も自然に動く
    setTimeout(() => {
      logo.classList.remove("poie-press");
    }, 200);
  });
});

// ↑確定
// ここから更新
