import { on, server } from '@sap/cds';

import proxy from '@sap/cds-odata-v2-adapter-proxy';

on('bootstrap', app => {

    app.use(proxy())

});

export default server;