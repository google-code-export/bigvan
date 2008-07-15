require File.dirname(__FILE__) + '/../test_helper'

class WikisControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:wikis)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_wiki
    assert_difference('Wiki.count') do
      post :create, :wiki => { }
    end

    assert_redirected_to wiki_path(assigns(:wiki))
  end

  def test_should_show_wiki
    get :show, :id => wikis(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => wikis(:one).id
    assert_response :success
  end

  def test_should_update_wiki
    put :update, :id => wikis(:one).id, :wiki => { }
    assert_redirected_to wiki_path(assigns(:wiki))
  end

  def test_should_destroy_wiki
    assert_difference('Wiki.count', -1) do
      delete :destroy, :id => wikis(:one).id
    end

    assert_redirected_to wikis_path
  end
end
