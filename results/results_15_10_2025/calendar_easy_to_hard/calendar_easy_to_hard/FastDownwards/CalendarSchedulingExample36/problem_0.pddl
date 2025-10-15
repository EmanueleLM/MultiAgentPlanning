(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)

  (:objects
    donald zachary kathryn deborah teresa james - participant

    ;; time objects for every 30-minute start within 09:00-16:30
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )

  (:init
    ;; initialize numeric total-cost and time-index for each time object
    (= (total-cost) 0)
    (= (time-index t09_00) 1)
    (= (time-index t09_30) 2)
    (= (time-index t10_00) 3)
    (= (time-index t10_30) 4)
    (= (time-index t11_00) 5)
    (= (time-index t11_30) 6)
    (= (time-index t12_00) 7)
    (= (time-index t12_30) 8)
    (= (time-index t13_00) 9)
    (= (time-index t13_30) 10)
    (= (time-index t14_00) 11)
    (= (time-index t14_30) 12)
    (= (time-index t15_00) 13)
    (= (time-index t15_30) 14)
    (= (time-index t16_00) 15)
    (= (time-index t16_30) 16)

    ;; mark all of these as allowable work slots (09:00..16:30)
    (workslot t09_00) (workslot t09_30) (workslot t10_00) (workslot t10_30)
    (workslot t11_00) (workslot t11_30) (workslot t12_00) (workslot t12_30)
    (workslot t13_00) (workslot t13_30) (workslot t14_00) (workslot t14_30)
    (workslot t15_00) (workslot t15_30) (workslot t16_00) (workslot t16_30)

    ;; ---------- AVAILABILITY FACTS ----------
    ;; Replace the following placeholders with the concrete availability facts you received:
    ;; For example, if Donald is available at 09:00 and 09:30, include:
    ;;   (available donald t09_00)
    ;;   (available donald t09_30)
    ;;
    ;; You were given the availability lists named:
    ;;   "availability_donald"
    ;;   "availability_zachary"
    ;;   "availability_kathryn"
    ;;   "availability_deborah"
    ;;   "availability_teresa"
    ;;   "availability_james"
    ;;
    ;; For each list, add (available <participant> <time-object>) lines here.
    ;; Example placeholder lines (DELETE or REPLACE these with real facts):
    ;; --- BEGIN PLACEHOLDERS ---
    ;; availability_donald:
    ;; (available donald t09_00)
    ;; (available donald t09_30)
    ;;
    ;; availability_zachary:
    ;; (available zachary t09_30)
    ;; (available zachary t10_00)
    ;;
    ;; availability_kathryn:
    ;; (available kathryn t09_00)
    ;; (available kathryn t09_30)
    ;;
    ;; availability_deborah:
    ;; (available deborah t09_00)
    ;; (available deborah t09_30)
    ;;
    ;; availability_teresa:
    ;; (available teresa t09_30)
    ;; (available teresa t09_00)
    ;;
    ;; availability_james:
    ;; (available james t09_00)
    ;; (available james t09_30)
    ;; --- END PLACEHOLDERS ---

    ;; NOTE: Remove placeholder facts and insert the exact facts derived from your six availability lists.
  )

  ;; Goal: some meeting is scheduled. The planner will minimize total-cost => earliest feasible time.
  (:goal (scheduled))

  ;; Instruct planner to minimize total-cost (earliest time-index)
  (:metric minimize (total-cost))
)