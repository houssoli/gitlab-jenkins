import hudson.model.*
def items = Hudson.getInstanceOrNull().allItems

items.each { item ->

    if (item instanceof Job) {

        def builds = item.getBuilds()

        builds.each { build ->
            def since = groovy.time.TimeCategory.minus( new Date(), build.getTime() )
            def status = build.getBuildStatusSummary().message
            println "Build: ${build} | Since: ${since} | Status: ${status}"
        }
    }
}
return