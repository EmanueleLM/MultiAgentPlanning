(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduler)

  (:objects
    alexander elizabeth walter - person

    ;; Unified timeslot names (mapped from the three agents' different namings)
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - timeslot
  )

  (:init
    ;; Work hours (agent2's within-work facts) - all 30-min start slots Monday 09:00-17:00
    (within-work s_09_00) (within-work s_09_30) (within-work s_10_00) (within-work s_10_30)
    (within-work s_11_00) (within-work s_11_30) (within-work s_12_00) (within-work s_12_30)
    (within-work s_13_00) (within-work s_13_30) (within-work s_14_00) (within-work s_14_30)
    (within-work s_15_00) (within-work s_15_30) (within-work s_16_00) (within-work s_16_30)

    ;; ------------------------
    ;; Agent 1 knowledge (free facts for Alexander, Elizabeth, Walter)
    ;; Alexander's availability per Agent 1: busy at 09:30,10:30,12:30,14:30,16:00-17:00
    ;; So list only the free slots as provided by agent1
    (free alexander s_09_00)
    (free alexander s_10_00)
    (free alexander s_11_00)
    (free alexander s_11_30)
    (free alexander s_12_00)
    (free alexander s_13_00)
    (free alexander s_13_30)
    (free alexander s_14_00)
    (free alexander s_15_00)
    (free alexander s_15_30)
    ;; s_09_30, s_10_30, s_12_30, s_14_30, s_16_00, s_16_30 are NOT marked free by agent1

    ;; Elizabeth per Agent 1: no busy info, listed as free all work-hour slots
    (free elizabeth s_09_00) (free elizabeth s_09_30)
    (free elizabeth s_10_00) (free elizabeth s_10_30)
    (free elizabeth s_11_00) (free elizabeth s_11_30)
    (free elizabeth s_12_00) (free elizabeth s_12_30)
    (free elizabeth s_13_00) (free elizabeth s_13_30)
    (free elizabeth s_14_00) (free elizabeth s_14_30)
    (free elizabeth s_15_00) (free elizabeth s_15_30)
    (free elizabeth s_16_00) (free elizabeth s_16_30)

    ;; Walter per Agent 1: no busy info given by agent1 -> free all work-hour slots
    (free walter s_09_00) (free walter s_09_30)
    (free walter s_10_00) (free walter s_10_30)
    (free walter s_11_00) (free walter s_11_30)
    (free walter s_12_00) (free walter s_12_30)
    (free walter s_13_00) (free walter s_13_30)
    (free walter s_14_00) (free walter s_14_30)
    (free walter s_15_00) (free walter s_15_30)
    (free walter s_16_00) (free walter s_16_30)

    ;; ------------------------
    ;; Agent 2 knowledge (busy facts for Elizabeth)
    ;; Agent2 reported Elizabeth busy at:
    ;; 09:00-09:30 -> s_09_00
    ;; 11:30-12:00 and 12:00-12:30 -> s_11_30 and s_12_00
    ;; 13:00-14:30 -> s_13_00, s_13_30, s_14_00
    (busy elizabeth s_09_00)
    (busy elizabeth s_11_30)
    (busy elizabeth s_12_00)
    (busy elizabeth s_13_00)
    (busy elizabeth s_13_30)
    (busy elizabeth s_14_00)

    ;; No explicit busy facts for Alexander or Walter were provided by agent2

    ;; ------------------------
    ;; Agent 3 knowledge (available facts)
    ;; Agent3 gave Alexander available at all work slots (no busy info)
    (available alexander s_09_00) (available alexander s_09_30)
    (available alexander s_10_00) (available alexander s_10_30)
    (available alexander s_11_00) (available alexander s_11_30)
    (available alexander s_12_00) (available alexander s_12_30)
    (available alexander s_13_00) (available alexander s_13_30)
    (available alexander s_14_00) (available alexander s_14_30)
    (available alexander s_15_00) (available alexander s_15_30)
    (available alexander s_16_00) (available alexander s_16_30)

    ;; Agent3 gave Elizabeth available at all work slots (no busy info from agent3)
    (available elizabeth s_09_00) (available elizabeth s_09_30)
    (available elizabeth s_10_00) (available elizabeth s_10_30)
    (available elizabeth s_11_00) (available elizabeth s_11_30)
    (available elizabeth s_12_00) (available elizabeth s_12_30)
    (available elizabeth s_13_00) (available elizabeth s_13_30)
    (available elizabeth s_14_00) (available elizabeth s_14_30)
    (available elizabeth s_15_00) (available elizabeth s_15_30)
    (available elizabeth s_16_00) (available elizabeth s_16_30)

    ;; Agent3 gave Walter limited availability: only s_14_30 and s_15_00 are available per agent3
    (available walter s_14_30)
    (available walter s_15_00)
  )

  ;; Goal: schedule a 30-minute meeting for Alexander, Elizabeth and Walter that
  ;; satisfies the constraints reported by all agents.
  ;; We require the meeting to be scheduled, at a concrete timeslot, and the three
  ;; participants to be marked as attending (to satisfy agent2's expectations).
  (:goal (and
    (meeting-scheduled)
    (meeting-at s_15_00)
    (attending alexander)
    (attending elizabeth)
    (attending walter)
  ))
)