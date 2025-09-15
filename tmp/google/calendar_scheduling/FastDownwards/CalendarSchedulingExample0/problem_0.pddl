(define (problem schedule-monday-integrated)
  (:domain integrated-scheduling)

  (:objects
    ;; half-hour timeslots from 09:00 to 16:30
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - timeslot

    meeting1 - meeting
  )

  (:init
    ;; time facts
    (time t9_00) (time t9_30) (time t10_00) (time t10_30)
    (time t11_00) (time t11_30) (time t12_00) (time t12_30)
    (time t13_00) (time t13_30) (time t14_00) (time t14_30)
    (time t15_00) (time t15_30) (time t16_00) (time t16_30)

    ;; consecutive half-hour relations
    (next t9_00 t9_30) (next t9_30 t10_00) (next t10_00 t10_30) (next t10_30 t11_00)
    (next t11_00 t11_30) (next t11_30 t12_00) (next t12_00 t12_30) (next t12_30 t13_00)
    (next t13_00 t13_30) (next t13_30 t14_00) (next t14_00 t14_30) (next t14_30 t15_00)
    (next t15_00 t15_30) (next t15_30 t16_00) (next t16_00 t16_30)

    ;; startable: meeting can start at any half-hour from 09:00 up to 16:00 (ends by 17:00)
    (startable t9_00) (startable t9_30) (startable t10_00) (startable t10_30)
    (startable t11_00) (startable t11_30) (startable t12_00) (startable t12_30)
    (startable t13_00) (startable t13_30) (startable t14_00) (startable t14_30)
    (startable t15_00) (startable t15_30) (startable t16_00)

    ;; Meeting object
    (meeting meeting1)

    ;; -----------------------
    ;; Michelle's availability (agent 1)
    ;; Agent1 provided hourly slots s9-10 ... s16-17 and stated Michelle is busy 11:00-12:00.
    ;; We translate that into half-hour free slots: Michelle is free for every half-hour in work hours
    ;; except the half-hours that lie within 11:00-12:00 (t11_00 and t11_30).
    ;; (i.e., all half-hour slots except t11_00 and t11_30)
    (free-michelle t9_00) (free-michelle t9_30)
    (free-michelle t10_00) (free-michelle t10_30)
    ;; t11_00 and t11_30 are busy for Michelle (no free-michelle facts for them)
    (free-michelle t12_00) (free-michelle t12_30)
    (free-michelle t13_00) (free-michelle t13_30)
    (free-michelle t14_00) (free-michelle t14_30)
    (free-michelle t15_00) (free-michelle t15_30)
    (free-michelle t16_00) (free-michelle t16_30)

    ;; -----------------------
    ;; Steven's availability (agent 2)
    ;; Agent2 gave precomputed starts where Steven is free for the full 60-min meeting.
    (free-steven-start t9_30)
    (free-steven-start t10_00)
    (free-steven-start t10_30)
    (free-steven-start t12_00)
    (free-steven-start t12_30)
    (free-steven-start t14_00)
    (free-steven-start t14_30)
    (free-steven-start t16_00)

    ;; -----------------------
    ;; Jerry's availability (agent 3)
    ;; Agent3 provided free half-hour slots; the only consecutive pair available was 14:30-15:30,
    ;; which corresponds to half-hours t14_30 and t15_00 in this naming.
    (free-jerry t14_30)
    (free-jerry t15_00)
  )

  ;; Goal: all three agents confirm the same meeting start and the meeting is finalized.
  ;; The integrated planner will use the distinct actions for each agent to confirm the same start time.
  (:goal (meeting-finalized meeting1))
)