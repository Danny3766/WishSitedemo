class WishListsController < ApplicationController
    
    before_action :find_wish_list, only: [:edit, :update, :destroy, :show]

    def index
        @wish_lists = WishList.all
    end

    def new
        @new_wish_list = WishList.new 
    end

    def create
        @new_wish_list = WishList.new(wish_list_params)
        if @new_wish_list.save
            flash[:notice] = "許願卡新增成功！"
            redirect_to root_path
        else
            # redirect_to new_wish_path, alert:"有欄位沒填唷"
            render :new
        end
    end

    def show 
    end

    def edit
    end

    def update
        if @wish_list.update(wish_list_params)
            redirect_to root_path, notice:"許願卡更新成功！"
        else
            render :edit
        end
    end

    def destroy
        @wish_list.destroy
        redirect_to root_path, notice:"許願卡刪除成功！"
    end

    private
    def find_wish_list
        @wish_list = WishList.find(params[:id])
    end

    def wish_list_params
        clean_params = params.require(:wish_list).permit(:title, :description)
    end
end
