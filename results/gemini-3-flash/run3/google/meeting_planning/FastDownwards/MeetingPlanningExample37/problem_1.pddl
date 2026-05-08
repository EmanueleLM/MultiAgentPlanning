(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    bayview financial_district - location
    t_0900 t_0919 t_1215 t_1345 t_1400 - time_step
    jeffrey - person
  )
  (:init
    (at bayview)
    (current_time t_0900)
    
    ;; Travel configuration: Bayview to Financial District takes 19 mins.
    ;; 9:00AM + 19 mins = 9:19AM
    (can_travel bayview financial_district t_0900 t_0919)
    
    ;; Meeting configuration: Jeffrey is at Financial District 12:15PM to 2:00PM.
    ;; Minimum meeting duration: 90 mins.
    ;; 12:15PM (t_1215) to 1:45PM (t_1345) is 90 minutes.
    (can_meet jeffrey financial_district t_1215 t_1345)
    
    ;; Timeline steps for the wait action
    (next t_0900 t_0919)
    (next t_0919 t_1215)
    (next t_1215 t_1345)
    (next t_1345 t_1400)
    
    ;; Meeting constraints logic:
    ;; Jeffrey is present at Financial District at these specific times.
    ;; (These are implied by the can_meet facts above).
  )
  (:goal (met jeffrey))
)