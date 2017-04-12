import HTTP
import Transport
import Sockets
import TLS

/// TCP and TLS clients from engine
/// wrapped to conform to ClientProtocol.
public final class ClientFactory<C: ClientProtocol>: ClientFactoryProtocol {
    /// Create a new EngineClient
    public func makeClient(
        hostname: String,
        port: Port,
        _ securityLayer: SecurityLayer
    ) throws -> ClientProtocol {
        return try C(
            hostname: hostname,
            port: port,
            securityLayer
        )
    }
    
    /// Responds to the request
    public func respond(to request: Request) throws -> Response {
        return try makeClient(for: request).respond(to: request)
    }
}