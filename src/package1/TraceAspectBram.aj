package package1;

public aspect TraceAspectBram {
	pointcut classToTrace(): within(ComponentApp) || within(DataApp)
			|| within(ServiceApp);
	
	pointcut methodToTrace(): classToTrace() && execution(new(..));
	
	before(): methodToTrace() {
        System.out.println("[BGN]" + thisJoinPointStaticPart.getSignature() + 
        		", " + thisJoinPointStaticPart.getSourceLocation().getLine());
        
            }
    after(): methodToTrace() {
        System.out.println("[END]" + thisJoinPointStaticPart.getSourceLocation().getFileName());
    }
}
