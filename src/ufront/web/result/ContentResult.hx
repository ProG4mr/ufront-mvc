package ufront.web.result;

import thx.error.NullArgument;
import ufront.web.context.ActionResultContext;

/** Represents a user-defined content type that is the result of an action method. */
class ContentResult extends ActionResult
{
	public var content : String;
	public var contentType : String;

	public function new(?content : String, ?contentType : String)
	{
		this.content = content;
		this.contentType = contentType;
	}

	override public function executeResult( actionContext:ActionResultContext ) {
		NullArgument.throwIfNull(actionContext);

		if(null != contentType)
			actionContext.response.contentType = contentType;

		actionContext.response.write(content);
	}
}