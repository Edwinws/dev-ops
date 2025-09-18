#!/usr/bin/env python3.10

import iterm2

# Session 1: 4400 - Debezium
# Session 2: 4401 - Debezium UI
# Session 3: 4402 - Kafka UI
# Session 4: Empty
async def main(connection):
    app = await iterm2.async_get_app(connection)

    window = app.current_terminal_window
    tab = window.current_tab

    session_1 = tab.current_session
    # Alternatively - await session_1.async_send_text('tabset -b "GCP PROD Debezium - 4400"\n')
    await init_session(session_1, "GCP PROD Debezium - 4400")
    await session_1.async_send_text('kubectl port-forward svc/debezium 4400:8083 -n kafka-prod\n')

    session_2 = await session_1.async_split_pane(vertical=True)
    await init_session(session_2, "GCP PROD Debezium-UI - 4401")
    await session_2.async_send_text('kubectl port-forward svc/debezium-ui 4401:8080 -n kafka\n')

    session_3 = await session_1.async_split_pane(vertical=False)
    await init_session(session_3, "GCP PROD Kafka-UI - 4402")
    await session_3.async_send_text('kubectl port-forward svc/kafka-ui 4402:8080 -n kafka\n')

    # Empty Session
    session_4 = await session_2.async_split_pane(vertical=False)


# Change tab color to Red
# Change Title
# Change Badge Text
async def init_session(session: iterm2.Session, text: str):
    change = iterm2.LocalWriteOnlyProfile()
    red_color = iterm2.Color(255, 0, 0)  # Red
    change.set_tab_color(red_color)
    change.set_use_tab_color(True)
    change.set_badge_text(text)

    await session.async_set_name(text)
    await session.async_set_profile_properties(change)


iterm2.run_until_complete(main)
