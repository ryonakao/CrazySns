class LikesController < ApplicationController

  def like
    note = Note.find(params[:note_id]) #送られたnote_idに対応したnoteインスタンスを生成
    like = current_user.likes.build(note_id: note.id) #現在ログイン中のユーザーに紐付いたlikeインスタンスを生成し、今見ていた投稿のidをnote_idカラムに入れる
    like.save
    redirect_to note
  end

  def unlike
    note = Note.find(params[:note_id])
    like = Like.find_by(user_id: current_user.id, note_id: note.id)
    like.destroy
    redirect_to note
  end


end
