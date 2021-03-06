require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    super
    @project = Project.new name: 'test', user_id: 1, id: 10010
  end

  test 'project should be valid' do
    assert @project.valid?
  end

  test 'user should be present' do
    @project.user_id = nil
    assert_not @project.valid?
  end
  
  test 'project directory create' do
    @project.create_home
    assert Datafolder::Env.exist? '1/10010'
    assert Datafolder::Env.exist? '1/10010/asset'
    assert Datafolder::Env.exist? '1/10010/index.ipynb'
  end

  test 'project destroy' do
    @project.destroy
    assert_not Datafolder::Env.exist? '1/10010'
  end
  
  test 'should not own two projects which have same name' do
    user = users :Man
    Project.create user_id: user.id, name: 'name1'
    project = Project.new user_id: user.id, name: 'name1'
    assert_not project.save
  end

end
