# FIXME StaticPageというのは変化のない静的なページという意味なので、もうちょっと良い名前がいいですね。
# RailsにはPageCacheというのがあるので、それを使ってトップページを表現することになるのであれば、この名前でもOKです。
class StaticPagesController < ApplicationController
  def home
    # FIXME データベースを検索するときは.limit(5)などをつけておくのがいいです。
    # 例えば写真が1000枚あった場合、トップページを表示するのがとても遅くなってしまいます。
    #
    # またkaminariというCoolなページネーションライブラリなどもあるので、それを活用してもいいです。
    @photos = Photo.order('created_at DESC')
  end
end
