import Quick
import Nimble
@testable import Luftree

class LFLocalDataServiceSpec: QuickSpec {
    override func spec() {
        let airportsDependency = [
            LFAirport(name: "Airport1", iata: "AI1", city: "Berlin", lat: "15,9878", lon: "129,178"),

            LFAirport(name: "Airport12", iata: "AI2", city: "Munich", lat: "15,9878", lon: "129,178"),

            LFAirport(name: "Airport3", iata: "AI3", city: "Shtuttgart", lat: "15,9878", lon: "129,178")]
        let localDataService = LFLocalDataService(airportsDependency)
        context("[UT]: Testing Local Data Service") {
            describe("On Search for airports") {
                it("Should fetch valid airports") {
                    let airports = try? localDataService.search(with: "Ber")
                    expect(airports).notTo(beNil())
                    expect(airports).notTo(beEmpty())
                    expect(airports?.first?.iata).to(equal("AI1"))
                }

                it("Should fail on invalid search term") {
                    expect { try localDataService.search(with: "") }.to(throwError())
                }
            }
        }
    }
}
