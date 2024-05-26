import Fastify from 'fastify'

const fastify = Fastify({
    logger: true,
})

fastify.get('/', function(request, reply) {
    reply.send({
        request: {
            headers: request.headers,
            body: request.body
        }
    })
})

fastify.get('/healthz', function(request, reply) {
    reply.send({
        status: 'ok'
    })
})

fastify.listen({host: '0.0.0.0', port: 4411}, (err, address) => {
    if (err) {
        fastify.log.error(err)
        process.exit(1)
    }
})