if window.opener? and
   window.opener.location.hostname == window.location.hostname and
   window.location.pathname == '/'
     window.opener.location.reload(true)
     window.close()
