import { getWeather } from "./weather";

const main = async () => {
	try {
		const url =
			"https://api.open-meteo.com/v1/forecast?latitude=47.91&longitude=106.88&current_weather=true";
		const weather = await getWeather(url);
		console.log("Weather in Ulaanbaatar");
		console.log("-------------------------");
		console.log(`Temperature: ${weather.current_weather.temperature}°C`);
		console.log(`Wind Speed : ${weather.current_weather.windspeed} km/h`);
	} catch (error) {
		if (error instanceof Error) {
			console.error(error.message);
			process.exit(1);
		}

		console.error("Unknown error");
		process.exit(1);
	}
};

main();
