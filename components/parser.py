class Parser:
    def __init__(self):
        self.argsr={}
    
    def parse(self, args):
        '-' in args[0] and len(args)>1 and self.addArg(args.pop(0),args.pop(0)) or self.addPrompt(args)
        if len(args)>0:
            self.parse(args)
    
    def addArg(self, opt, arg):
        self.argsr[opt]=arg
    
    def addPrompt(self, args):
        prompt = ""
        while len(args)>0:
            prompt += args.pop(0) +' '
        self.argsr['prompt'] = prompt