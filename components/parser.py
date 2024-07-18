NO_ARGS_PARAMS = ('-i', '-o', '-t','-C','--init', '--API_KEY', '--save','--read', '--s2t', '--configure')
ARGS_PARAMS = ('-s', '-r')

class Parser:
    def __init__(self):
        self.argsr={}
    
    def parse(self, args):
        '-' in args[0] and len(args)>0 and self.addArg(args.pop(0),args) or self.addPrompt(args)
        len(args)>0 and self.parse(args)
    
    def addArg(self, opt, args):
        if opt in ARGS_PARAMS:
            self.argsr[opt]=args.pop(0)
        else:
            self.argsr[opt]=True
    
    def addPrompt(self, args):
        prompt = ""
        while len(args)>0:
            prompt += args.pop(0) +' '
        self.argsr['prompt'] = prompt