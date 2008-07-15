class WikisController < ApplicationController
  # GET /wikis
  # GET /wikis.xml
  def index
    @wikis = Wiki.find(:all,:order=>'id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wikis }
    end
  end
  # GET /content/xxxx
  def show_by_title
    @wiki=Wiki.find_by_title(params[:title])
    respond_to do |format|
      if @wiki
        format.html
        format.xml  { render :xml => @wiki }
      else
        format.html{ redirect_to :controller=>"wikis",:action=>"new",:title=>params[:title]  }
        format.xml{head 500}
      end
    end
  end
  # GET /wikis/1
  # GET /wikis/1.xml
  def show
    @wiki = Wiki.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wiki }
    end
  end

  # GET /wikis/new
  # GET /wikis/new.xml
  def new
    @wiki = Wiki.new
    if params[:title]
      @wiki.title=params[:title]
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wiki }
    end
  end

  # GET /wikis/1/edit
  def edit
    @wiki = Wiki.find(params[:id])
  end

  # POST /wikis
  # POST /wikis.xml
  def create
    @wiki = Wiki.new(params[:wiki])

    respond_to do |format|
      if @wiki.save
        flash[:notice] = 'Wiki was successfully created.'
        format.html { redirect_to(@wiki) }
        format.xml  { render :xml => @wiki, :status => :created, :location => @wiki }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wiki.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wikis/1
  # PUT /wikis/1.xml
  def update
    @wiki = Wiki.find(params[:id])

    respond_to do |format|
      if @wiki.update_attributes(params[:wiki])
        flash[:notice] = 'Wiki was successfully updated.'
        format.html { redirect_to(@wiki) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wiki.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.xml
  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy

    respond_to do |format|
      format.html { redirect_to(wikis_url) }
      format.xml  { head :ok }
    end
  end
end
