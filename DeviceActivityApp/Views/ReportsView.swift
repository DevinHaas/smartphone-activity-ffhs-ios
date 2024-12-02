import SwiftUI

struct ReportsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Daily Activity Report Section with Logging
            VStack(alignment: .leading, spacing: 10) {
                SectionHeader(title: "Daily Report")
                DeviceActivityDailyReportAdapter()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .onAppear {
                logRenderTime(for: "Daily Report")
            }

            // Weekly Activity Report Section with Logging
            VStack(alignment: .leading, spacing: 10) {
                SectionHeader(title: "Weekly Report")
                DeviceActivityWeeklyReportAdapter()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .onAppear {
                logRenderTime(for: "Weekly Report")
            }
        }
    }

    // MARK: - Logging Function
    private func logRenderTime(for reportType: String) {
        let startTime = DispatchTime.now()

        // Simulate rendering or computation delay
        DispatchQueue.main.async {
            let endTime = DispatchTime.now()
            let elapsedTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
            let elapsedTimeInMilliseconds = Double(elapsedTime) / 1_000_000 // Convert to milliseconds
            print("\(reportType) Render Time: \(elapsedTimeInMilliseconds) ms")
        }
    }
}

// MARK: - Section Header Component
struct SectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
