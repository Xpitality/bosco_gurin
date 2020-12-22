require 'rails_helper'

describe Api::V1::InfoSnowController, type: :request do

  let(:headers) { { 'Content-Type': 'application/json', 'Accept': 'application/json' } }
  let(:endpoint) { api_v1_info_snow_feed_path }

  it 'returns 200 and info snow feed' do

    get endpoint, headers: headers

    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(response).to have_http_status(:success)

    puts response.body

    expect_json_keys('resort', [:resortId,
                                  :resortName,
                                  :SKDailyNumberOfOpenFacilities,
                                  :SKDailyNumberOfPreparationFacilities,
                                  :SKDailyNumberOfFacilities,
                                  :SKDailyFacilitiesOpenedFrom,
                                  :SKDailyFacilitiesOpenedTo,
                                  :SKDailyFacilitiesRemarks_de,
                                  :SKDailyFacilitiesRemarks_fr,
                                  :SKDailyFacilitiesRemarks_it,
                                  :SKDailyFacilitiesRemarks_en,
                                  :SKDailyFacilitiesRemarks_es,
                                  :SKDailyFacilitiesRemarks_nl,
                                  :SKDailySlopesOpen,
                                  :SKDailySlopesPreparation,
                                  :SKDailySlopes,
                                  :SKDailySlopesOpenCount,
                                  :SKDailySlopesCount,
                                  :SKDailyRunCondition,
                                  :SKDailySnowConditionMain,
                                  :SKDailySnowConditionPartial,
                                  :SKDailyFloodlitTodayTill,
                                  :SKDailyValleyRunHeight,
                                  :SKDailyValleyRunConditionMain,
                                  :SKDailyValleyRunConditionPartial,
                                  :SKDailyRemarks_de,
                                  :SKDailyRemarks_fr,
                                  :SKDailyRemarks_it,
                                  :SKDailyRemarks_en,
                                  :SKDailyRemarks_es,
                                  :SKDailyRemarks_nl,
                                  :SBDailyParkOpenedToday,
                                  :SBDailyPark,
                                  :SBDailyConditionOfRuns,
                                  :SBDailySnowparkOpenedToday,
                                  :SBDailySnowpark,
                                  :SBDailySnowparkFloodlight,
                                  :SBDailyFloodlitTodayTill,
                                  :SBDailyRemarks_de,
                                  :SBDailyRemarks_fr,
                                  :SBDailyRemarks_it,
                                  :SBDailyRemarks_en,
                                  :SBDailyRemarks_es,
                                  :SBDailyRemarks_nl,
                                  :CCDailyLowestPointToday,
                                  :CCDailyPreparedTracksLengthClassic,
                                  :CCDailyTotalTracksLengthClassic,
                                  :CCDailyNumberOfOpenedClassicTracks,
                                  :CCDailyNumberOfClassicTracks,
                                  :CCDailyTrackConditionClassic,
                                  :CCDailyPreparedTracksLengthSkating,
                                  :CCDailyTotalTracksLengthSkating,
                                  :CCDailyNumberOfOpenedSkatingTracks,
                                  :CCDailyNumberOfSkatingTracks,
                                  :CCDailyTrackConditionSkating,
                                  :CCDailyFloodlitLengthToday,
                                  :CCDailyFloodlitTodayTill,
                                  :CCDailyRemarks_de,
                                  :CCDailyRemarks_fr,
                                  :CCDailyRemarks_it,
                                  :CCDailyRemarks_en,
                                  :CCDailyRemarks_es,
                                  :CCDailyRemarks_nl,
                                  :CCDailyPreparedWalkingTrailsLength,
                                  :CCDailyTotalWalkingTrailsLength,
                                  :CCDailyWalkingNumberOfOpenedTrails,
                                  :CCDailyWalkingNumberOfTrails,
                                  :CCDailyWalkingTrailHeightToday,
                                  :CCDailySnowshoeTrailsLength,
                                  :CCDailySnowshoeTrailsLengthTotal,
                                  :CCDailySnowshoeNumberOfOpenedTrails,
                                  :CCDailySnowshoeNumberOfTrails,
                                  :HKDailyConditionOfTrails,
                                  :CCDailyWalkingRemarks_de,
                                  :CCDailyWalkingRemarks_fr,
                                  :CCDailyWalkingRemarks_it,
                                  :CCDailyWalkingRemarks_en,
                                  :CCDailyWalkingRemarks_es,
                                  :CCDailyWalkingRemarks_nl,
                                  :TODailyNumberOfOpenedRuns,
                                  :TODailyNumberOfRuns,
                                  :TODailyRunsLength,
                                  :TODailyRunsLengthTotal,
                                  :TODailyRunCondition,
                                  :TODailyContinuousPassablyProportion,
                                  :TODailySkills,
                                  :TODailyRemarks_de,
                                  :TODailyRemarks_fr,
                                  :TODailyRemarks_it,
                                  :TODailyRemarks_en,
                                  :TODailyRemarks_es,
                                  :TODailyRemarks_nl,
                                  :WTDailyWeatherToday,
                                  :WTDailyTemperature,
                                  :WTDailyWeatherTomorrow,
                                  :WTDailyTemperatureTomorrow,
                                  :WTDailyWeatherAfterTomorrow,
                                  :WTDailyTemperatureAfterTomorrow,
                                  :WTDailyRoadCondition,
                                  :WTDailyHint_de,
                                  :WTDailyHint_fr,
                                  :WTDailyHint_it,
                                  :WTDailyHint_en,
                                  :WTDailyHint_es,
                                  :WTDailyHint_nl,
                                  :WTDailyNewFallenSnowHeightResort,
                                  :WTDailyNewFallenSnowHeightArenaLow,
                                  :WTDailyNewFallenSnowHeightArenaHigh,
                                  :WTDailyDateLastSnowfallResort,
                                  :WTDailyDateLastSnowfallArena,
                                  :WTDailyDepthSnowOrtResort,
                                  :WTDailyDepthSnowOrtArenaLow,
                                  :WTDailyDepthSnowOrtArenaHigh,
                                  :ResortDailyNews_de,
                                  :ResortDailyNews_fr,
                                  :ResortDailyNews_it,
                                  :ResortDailyNews_en,
                                  :ResortDailyNews_es,
                                  :ResortDailyNews_nl])

    expect_json_keys('elements.*', [:name, :Element])

    expect_json('elements.0', name: 'ANLAGE')
    expect_json_types('elements.0.Element.*', Id: :string, Initial: :string, Name: :string, TypID: :string, StatusID: :string)

    expect_json('elements.1', name: 'SKIPISTE')
    expect_json_types('elements.1.Element.*', Id: :string, Initial: :string, Name: :string, TypID: :string, StatusID: :string, LaengeGesamt: :string, LaengeDynamisch: :string)

    expect_json('elements.2', name: 'SCHLITTELWEG')
    expect_json_types('elements.2.Element.*', Id: :string, Initial: :string, Name: :string, TypID: :string, StatusID: :string)

    expect_json('elements.3', name: 'WANDERWEG')
    expect_json_types('elements.3.Element.?', Id: :string, Initial: :string, Name: :string, TypID: :string, StatusID: :string, LaengeGesamt: :string, LaengeDynamisch: :string)

    expect_json('elements.4', name: 'PARK')
    expect_json_types('elements.4.Element.*', Id: :string, Name: :string, TypID: :string, StatusID: :string)

    expect_json('elements.5', name: 'LOIPE')
    expect_json_types('elements.5.Element', Id: :string, Initial: :string, Name: :string, TypID: :string, StatusID: :string, LaengeGesamt: :string, LaengeDynamisch: :string)

    expect_json('elements.6', name: 'RESTAURANT')
    expect_json_types('elements.6.Element.*', Id: :string, Name: :string, TypID: :string, StatusID: :string)

    expect_json('elements.7', name: 'DIVERSES')
    expect_json_types('elements.7.Element.*', Id: :string, Name: :string, TypID: :string, StatusID: :string)

    expect_json('elements.8', name: 'GEFAHR')
    expect_json_types('elements.8.Element', Id: :string, Name: :string, LawinenstatusId: :string)

    expect_json_sizes(elements: 9)

    expect_json_types(types: :object)
    expect_json_keys(:states)
  end
end
