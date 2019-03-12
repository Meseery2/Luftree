import Quick
import Nimble
@testable import Luftree

class LFScheduleMapModuleBuilderSpec: QuickSpec {
    override func spec() {
        context("Testing Schedule MAp Module Builder") {
            describe("Should build module successfully") {
                let dummyDependency = Schedule(totalJourney: nil, flights: nil)
                let view = LFScheduleMapBuilder.build(with: dummyDependency) as? ScheduleMapView
                expect(view)
                    .notTo(beNil())
                expect(view?.presenter)
                    .notTo(beNil())
                expect(view?.presenter?.router)
                    .notTo(beNil())
                expect(view)
                    .to(beAKindOf(ScheduleMapView.self))
                expect(view?.presenter)
                    .to(beAKindOf(ScheduleMapPresenter.self))
                expect(view?.presenter?.router)
                    .to(beAKindOf(ScheduleMapRouter.self))
            }
        }
    }
}
