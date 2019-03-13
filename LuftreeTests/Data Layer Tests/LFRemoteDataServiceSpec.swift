import Quick
import Nimble
@testable import Luftree

class LFRemoteDataServiceSpec: QuickSpec {
    override func spec() {
        let networkServiceDependency = LFNetworkServiceMock.init(true, stubFilename: "Schedules")
        let tokenServiceDependency = LFTokenServiceMock.init()
        let sut = LFRemoteDataService(networkService: networkServiceDependency, tokenService: tokenServiceDependency)
        let searchParamMock = SearchParamMock.searchParameters
        context("[UT]: Testing Remote Data Service") {
            describe("Test fetching schedules functionality") {
                waitUntil { done in
                    sut.fetchSchedules(searchParams: searchParamMock,
                                       onCompletion: { (result) in
                                        if case .success = result {
                                            done ()
                                        } else {
                                            fail()
                                        }
                    })
                }
            }
        }
    }
}
