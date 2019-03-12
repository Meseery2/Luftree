import Quick
import Nimble
@testable import Luftree

class LFSchedulesModuleBuilderSpec: QuickSpec {
    override func spec() {
        context("Testing Schdeules Module Builder") {
            describe("Should build module successfully") {
                let view = LFSchedulesModuleBuilder.build(with: []) as? SchedulesView
                expect(view)
                    .notTo(beNil())
                expect(view?.presenter)
                    .notTo(beNil())
                expect(view?.presenter?.router)
                    .notTo(beNil())
                expect(view)
                    .to(beAKindOf(SchedulesView.self))
                expect(view?.presenter)
                    .to(beAKindOf(SchedulesPresenter.self))
                expect(view?.presenter?.router)
                    .to(beAKindOf(SchedulesRouter.self))
            }
        }
    }
}
