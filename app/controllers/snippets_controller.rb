class SnippetsController < ApplicationController
  
  def index
    @snippets = Snippet.all(:order => "created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @snippets }
    end
  end

  def new
    @snippet = Snippet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @snippet }
    end
  end

  def create
    @snippet = Snippet.new(params[:snippet])

    if @snippet.save
      Resque.enqueue(SnippetHighlighter, @snippet.id)
      redirect_to(snippets_url, :notice => 'Snippet was successfully created.')
    else
      render :action => "new"
    end
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    redirect_to(snippets_url)
  end
end
