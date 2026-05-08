(define (problem sf_meet_mary_instance)
  (:domain sf_meet_mary)

  (:objects
    union_square nob_hill - location
    mary - person
    t_9_00am
    t_9_07am
    t_9_14am
    t_9_21am
    t_9_28am
    t_9_35am
    t_9_42am
    t_9_49am
    t_9_56am
    t_10_03am
    t_10_10am
    t_10_17am
    t_10_24am
    t_10_31am
    t_10_38am
    t_10_45am
    t_10_52am
    t_10_59am
    t_11_06am
    t_11_13am
    t_11_20am
    t_11_27am
    t_11_34am
    t_11_41am
    t_11_48am
    t_11_55am
    t_12_04pm
    t_1_19pm - time
  )

  (:init
    (at union_square)
    (current_time t_9_00am)

    (wait_step t_9_00am t_9_07am)
    (wait_step t_9_07am t_9_14am)
    (wait_step t_9_14am t_9_21am)
    (wait_step t_9_21am t_9_28am)
    (wait_step t_9_28am t_9_35am)
    (wait_step t_9_35am t_9_42am)
    (wait_step t_9_42am t_9_49am)
    (wait_step t_9_49am t_9_56am)
    (wait_step t_9_56am t_10_03am)
    (wait_step t_10_03am t_10_10am)
    (wait_step t_10_10am t_10_17am)
    (wait_step t_10_17am t_10_24am)
    (wait_step t_10_24am t_10_31am)
    (wait_step t_10_31am t_10_38am)
    (wait_step t_10_38am t_10_45am)
    (wait_step t_10_45am t_10_52am)
    (wait_step t_10_52am t_10_59am)
    (wait_step t_10_59am t_11_06am)
    (wait_step t_11_06am t_11_13am)
    (wait_step t_11_13am t_11_20am)
    (wait_step t_11_20am t_11_27am)
    (wait_step t_11_27am t_11_34am)
    (wait_step t_11_34am t_11_41am)
    (wait_step t_11_41am t_11_48am)
    (wait_step t_11_48am t_11_55am)

    (travel_step union_square nob_hill t_11_55am t_12_04pm)

    (meeting_option mary nob_hill t_12_04pm t_1_19pm)
  )

  (:goal
    (and
      (met mary)
      (at nob_hill)
      (current_time t_1_19pm)
    )
  )
)