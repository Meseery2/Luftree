import Quick
import Nimble
@testable import Luftree

class LFTokenServiceSpec: QuickSpec {
    override func spec() {
        Nimble.AsyncDefaults.Timeout = 5
        Nimble.AsyncDefaults.PollInterval = 0.1
        let tokenService = LFTokenService.instance
        context("[UT]: Testing Remote Data Service") {
            describe("On getting new Token") {
                waitUntil { done in
                    tokenService.getToken({ (token) in
                        expect(token).notTo(beNil())
                        done()
                    })
                }
            }
        }
    }
}
