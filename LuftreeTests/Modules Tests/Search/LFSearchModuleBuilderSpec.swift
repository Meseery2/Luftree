import Quick
import Nimble
@testable import Luftree

class LFSearchModuleBuilderSpec: QuickSpec {
    override func spec() {
        context("Testing Search Module Builder") {
            describe("Should build module successfully") {
                    let navigationViewController = LFSearchModuleBuilder.build() as? UINavigationController
                    let view = navigationViewController?.topViewController as? SearchViewController
                    expect(view)
                        .notTo(beNil())
                    expect(view?.presenter)
                        .notTo(beNil())
                    expect(view?.presenter?.interactor)
                        .notTo(beNil())
                    expect(view?.presenter?.router)
                        .notTo(beNil())
                    expect(view)
                        .to(beAKindOf(SearchViewController.self))
                    expect(view?.presenter)
                        .to(beAKindOf(SearchPresenter.self))
                    expect(view?.presenter?.router)
                        .to(beAKindOf(SearchRouter.self))
            }
        }
    }
}
