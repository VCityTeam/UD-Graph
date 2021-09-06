class URI:
    """An URI object which has a localname and a namespace."""
    def __init__(self, uri: str):
        uri = str(uri)
        self.namespace = None
        self.localname = None

        if '#' in uri:
            self.namespace = uri.split('#')[0] + '#'
            self.localname = uri.split('#')[-1]
        else:
            self.namespace = '/'.join(uri.split('/')[:-1]) + '/'
            self.localname = uri.split('/')[-1]

    def __str__(self):
        return self.namespace + self.localname

    def __repr__(self):
        return self.namespace + self.localname