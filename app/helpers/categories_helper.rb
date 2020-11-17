module CategoriesHelper
  def category_main_image(category)
    if category.articles.last.image.attached?
      link_to(image_tag(category.articles.last.image), category_path(category))
    else
      link_to(image_tag('article.png'), category_path(category))
    end
  end

  def category_show(article)
    @count += 1
    if @count <= 2
      "<div class='col-12 col-lg-6 category-article-container m-0 p-0 row'>
        <div class='category-article-image w-100 col-6 m-0 p-0'>
            #{if article.image.attached?
                link_to(image_tag(article.image), article_path(article))
              else
                link_to(image_tag('article.png'), article_path(article))
              end }

        </div>
        <div class='category-article-details col-6 bg-white p-0'>
             #{image_tag 'bg.jpg', class: 'w-100'}
            <div class='details p-3'>
                <div class='category-name'>
                     #{@category.name}
                </div>
                <div class='title'>
                     #{article.title}
                </div>
                <div class='author-name'>
                    By   #{link_to "@ #{article.user.name}", user_path(article.user)}
                </div>
                <div class='body'>
                     #{article.body.truncate(150)}
                </div>
                <div class='d-flex justify-content-between'>

                <div class='read-more pt-3'>
                     #{link_to 'Read more', article_path(article)}
                </div>
                     #{vote_button(article)}
                </div>
            </div>
        </div>
    </div>".html_safe
    else
      "<div class='col-12 col-lg-6 category-article-container m-0 p-0 row'>
      <div class='category-article-image w-100 col-6 order-1 m-0 p-0'>
          #{if article.image.attached?
              link_to(image_tag(article.image), article_path(article))
            else
              link_to(image_tag('article.png'), article_path(article))
            end }

      </div>
      <div class='category-article-details col-6 bg-white p-0'>
           #{image_tag 'bg.jpg', class: 'w-100'}
          <div class='details p-3'>
              <div class='category-name'>
                   #{@category.name}
              </div>
              <div class='title'>
                   #{article.title}
              </div>
              <div class='author-name'>
                  By   #{link_to "@ #{article.user.name}", user_path(article.user)}
              </div>
              <div class='body'>
                   #{article.body.truncate(150)}
              </div>
              <div class='d-flex justify-content-between'>

              <div class='read-more pt-3'>
                   #{link_to 'Read more', article_path(article)}
              </div>
                   #{vote_button(article)}
              </div>
          </div>
      </div>
  </div>".html_safe
    end
  end
end
