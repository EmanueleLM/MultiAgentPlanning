(define (problem integrated-schedule-monday)
  (:domain integrated-scheduling)
  (:objects
    adam jerry matthew - person
    m1 - meeting
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; meeting and participants
    (meeting m1)
    (meeting-participant m1 adam) (meeting-participant m1 jerry) (meeting-participant m1 matthew)

    ;; all slots exist and are initially free
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    (slot-free s0900) (slot-free s0930) (slot-free s1000) (slot-free s1030)
    (slot-free s1100) (slot-free s1130) (slot-free s1200) (slot-free s1230)
    (slot-free s1300) (slot-free s1330) (slot-free s1400) (slot-free s1430)
    (slot-free s1500) (slot-free s1530) (slot-free s1600) (slot-free s1630)

    ;; ---------- Agent1 facts (from first agent) ----------
    ;; Adam's known availability (agent1 provides these available facts)
    (available adam s0900) (available adam s0930)
    (available adam s1030) (available adam s1100) (available adam s1130)
    (available adam s1200) (available adam s1300)
    (available adam s1430) (available adam s1500) (available adam s1530)
    (available adam s1600) (available adam s1630)
    ;; Agent1's known busy slots for Adam (explicit busy facts)
    ;; Adam busy at: 10:00 (s1000), 12:30 (s1230), 13:30 (s1330), 14:00 (s1400)
    (busy adam s1000) (busy adam s1230) (busy adam s1330) (busy adam s1400)

    ;; ---------- Agent2 facts (from second agent) ----------
    ;; free facts as agent2 reported (agent2 marked Adam and Matthew free for all,
    ;; and Jerry free at the listed slots; we include these as 'free' facts)
    ;; Adam free (agent2): all work slots
    (free adam s0900) (free adam s0930) (free adam s1000) (free adam s1030)
    (free adam s1100) (free adam s1130) (free adam s1200) (free adam s1230)
    (free adam s1300) (free adam s1330) (free adam s1400) (free adam s1430)
    (free adam s1500) (free adam s1530) (free adam s1600) (free adam s1630)

    ;; Matthew free (agent2): all work slots (agent2 had no busy info for Matthew)
    (free matthew s0900) (free matthew s0930) (free matthew s1000) (free matthew s1030)
    (free matthew s1100) (free matthew s1130) (free matthew s1200) (free matthew s1230)
    (free matthew s1300) (free matthew s1330) (free matthew s1400) (free matthew s1430)
    (free matthew s1500) (free matthew s1530) (free matthew s1600) (free matthew s1630)

    ;; Jerry's availability per agent2 (agent2 provided Jerry busy at 09:00, 12:00, 15:00-16:00)
    ;; So Jerry free at the other slots:
    (free jerry s0930) (free jerry s1000) (free jerry s1030)
    (free jerry s1100) (free jerry s1130) (free jerry s1230)
    (free jerry s1300) (free jerry s1330) (free jerry s1400)
    (free jerry s1430) (free jerry s1600) (free jerry s1630)
    ;; Jerry busy facts from agent2:
    (busy jerry s0900) (busy jerry s1200) (busy jerry s1500) (busy jerry s1530)

    ;; ---------- Agent3 facts (from third agent) ----------
    ;; Agent3 provided Matthew's more specific availability (conservative):
    ;; Matthew free at: s0900, s1100, s1230, s1400
    ;; (these facts may overlap with agent2's broader 'free' facts)
    (free matthew s0900) (free matthew s1100) (free matthew s1230) (free matthew s1400)

    ;; Agent3 provided Matthew's busy slots (explicit):
    ;; Busy: s0930, s1000, s1030, s1130, s1200, s1300, s1330, s1430, s1500, s1530, s1600, s1630
    (busy matthew s0930) (busy matthew s1000) (busy matthew s1030)
    (busy matthew s1130) (busy matthew s1200)
    (busy matthew s1300) (busy matthew s1330)
    (busy matthew s1430) (busy matthew s1500) (busy matthew s1530) (busy matthew s1600) (busy matthew s1630)

    ;; Note: We keep both 'free' and 'available' facts as reported by different agents.
    ;; The scheduling actions require checks against explicit busy facts to avoid
    ;; scheduling where someone is known to be busy.

    ;; No explicit available facts for Jerry or Matthew were provided by agent1,
    ;; and no explicit 'available' confirmations were provided for agent3 participants.
    ;; The planner can use the agent2 free facts together with the negative (not busy)
    ;; checks to find a slot consistent with all agents' known constraints.
  )

  ;; Goal: schedule the 30-minute meeting for m1 at some slot within working hours.
  ;; We express the goal existentially: there exists a slot that becomes meeting_scheduled.
  (:goal (exists (?s - slot) (meeting_scheduled ?s)))
)